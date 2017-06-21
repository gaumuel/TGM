/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#include "SBDFReaction3.h"

template<>
InputParameters validParams<SBDFReaction3>()
{
	InputParameters params = validParams<Kernel>();
	
	// Add a required parameter.  If this isn't provided in the input file MOOSE will error.
	params.addRequiredParam<Real>("a", "The constant a = (\\c_3^2\\frac{K}{D}) ");
	params.addRequiredParam<Real>("alpha", "Scaling factor (\\c_2 = \\alpha \\c_3)");
	params.addCoupledVar("v", "variable to use u_old_older");
	return params;
}

SBDFReaction3::SBDFReaction3(const InputParameters & parameters) :
Kernel(parameters),
// Get the parameters from the input file
_a(getParam<Real>("a")),
_alpha(getParam<Real>("alpha")),
_u_old(valueOld()),
_u_older(valueOlder()),
_t_step(_fe_problem.timeStep()),
_v(coupledValueOld("v"))
{
}

Real
SBDFReaction3::computeQpResidual()
{
	
	_resF_old = -1.0 * _test[_i][_qp] * _a * _u_old[_qp] * (1 - _u_old[_qp]) * (_u_old[_qp] - _alpha);
	
	if (_t_step == 1)
	{
		return _resF_old;
	}
	else
	{
		_resF_older = -1.0 * _test[_i][_qp] * _a * _u_older[_qp] * (1 - _u_older[_qp]) * (_u_older[_qp] - _alpha);
		
		if (_t_step == 2)
		{
			
			return 2.0 * _resF_old - 1.0 * _resF_older;
			
		}
		else
		{
			
			_resF_old_older = -1.0 * _test[_i][_qp] * _a * _v[_qp] * (1 - _v[_qp]) * (_v[_qp] - _alpha);
			
			return 3.0 * _resF_old - 3.0 * _resF_older + _resF_old_older;
		}
	}
}

Real
SBDFReaction3::computeQpJacobian()
{
	return 0.0;
}

