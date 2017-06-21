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

#include "BDFTimeDerivative3.h"

template<>
InputParameters validParams<BDFTimeDerivative3>()
{
	InputParameters params = validParams<TimeDerivative>();
	params.addCoupledVar("v", "variable to use u_old_older");
	return params;
}

BDFTimeDerivative3::BDFTimeDerivative3(const InputParameters & parameters) :
TimeDerivative(parameters),
_u_old(valueOld()),
_u_older(valueOlder()),
_t_step(_fe_problem.timeStep()),
_v(coupledValueOld("v"))
// This kernel expects an input parameter named "time_coefficient"
{}

Real
BDFTimeDerivative3::computeQpResidual()
{
	if (_t_step == 1)
	{
		return   _test[_i][_qp] * (1/_dt) * ( _u[_qp] - _u_old[_qp]);
	}
	else
	{
		if (_t_step == 2)
		{
			
			return _test[_i][_qp] * (1/_dt) * ( _u[_qp] - _u_old[_qp]);//_test[_i][_qp] * (1/_dt) * (1.5 * _u[_qp] - 2 * _u_old[_qp] +  0.5 * _u_older[_qp]);
			
		}
		else
		{
			if (_current_elem->id() ==0 && _t_step < 12 &&_t_step > 8 && _qp == 0)
			{
				std::cout << "Old: " << _u_old[_qp] << std::endl;
				std::cout << "Older: " << _u_older[_qp] << std::endl;
				std::cout << "Old_older: " << _v[_qp] << std::endl;
			}
			time_derivative = _test[_i][_qp] * (1/_dt) * (11.0/6.0 * _u[_qp] - 3.0 * _u_old[_qp] +  1.5 * _u_older[_qp] - 1.0/3.0 * _v[_qp]);
			
			return time_derivative;
		}
	}
}

Real
BDFTimeDerivative3::computeQpJacobian()
{
	if ( _t_step == 1)
	{
		return _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);
	}
	else
	{
		if (_t_step == 2)
		{
			return _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);//1.5 * _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);
		}
		else
		{
			return 11.0/6.0 * _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);
		}
		
	}
}
