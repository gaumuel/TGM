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

#include "BDFTimeDerivative.h"

template<>
InputParameters validParams<BDFTimeDerivative>()
{
	InputParameters params = validParams<TimeDerivative>();
	return params;
}

BDFTimeDerivative::BDFTimeDerivative(const InputParameters & parameters) :
TimeDerivative(parameters),
_u_old(valueOld()),
_u_older(valueOlder()),
_t_step(_fe_problem.timeStep())
// This kernel expects an input parameter named "time_coefficient"
{}

Real
BDFTimeDerivative::computeQpResidual()
{
	if (_t_step ==1 )
		
		return   _test[_i][_qp] * (1/_dt) * ( _u[_qp] - _u_old[_qp]);
	
	else
		
		return _test[_i][_qp] * (1/_dt) * (1.5 * _u[_qp] - 2 * _u_old[_qp] +  0.5 * _u_older[_qp]);
}

Real
BDFTimeDerivative::computeQpJacobian()
{
	if (_t_step == 1)
		
		return _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);
	
	else
		
		return 1.5 * _test[_i][_qp] * _phi[_j][_qp] * (1/_dt);
}
