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

#include "ExplicitReaction.h"

template<>
InputParameters validParams<ExplicitReaction>()
{
  InputParameters params = validParams<Kernel>();
	
	// Add a required parameter.  If this isn't provided in the input file MOOSE will error.
	params.addRequiredParam<Real>("a", "The constant a = (\\c_3^2\\frac{K}{D}) ");
	params.addRequiredParam<Real>("alpha", "Scaling factor (\\c_2 = \\alpha \\c_3)");
  return params;
}

ExplicitReaction::ExplicitReaction(const InputParameters & parameters) :
    Kernel(parameters),
		// Get the parameters from the input file
		_a(getParam<Real>("a")),
		_alpha(getParam<Real>("alpha")),
		_u_old(valueOld())
{
}

Real
ExplicitReaction::computeQpResidual()
{
	
	return -1.0 * _test[_i][_qp] * _a * _u_old[_qp] * (1 - _u_old[_qp]) * (_u_old[_qp] - _alpha);
}

Real
ExplicitReaction::computeQpJacobian()
{
	return -1.0 * _test[_i][_qp] * _phi[_j][_qp] * ( 2 * _a * _u_old[_qp]
																	- _alpha * _a
																	- 3 * _a * _u_old[_qp] *  _u_old[_qp]
																	+ 2 * _alpha * _a *  _u_old[_qp]);
}

