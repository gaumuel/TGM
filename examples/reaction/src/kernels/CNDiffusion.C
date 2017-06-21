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

#include "CNDiffusion.h"


template<>
InputParameters validParams<CNDiffusion>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak form of $(\\nabla \\phi_i, \\nabla u_h)$.");
  return params;
}

CNDiffusion::CNDiffusion(const InputParameters & parameters) :
    Kernel(parameters),
		_u_old(valueOld()),
		_u_older(valueOlder()),
		_grad_u_old(_var.gradSlnOld()),
		_t_step(_fe_problem.timeStep())
{
}

Real
CNDiffusion::computeQpResidual()
{
	_resU = _grad_u[_qp] * _grad_test[_i][_qp];
	
	if ( _t_step == 1)
	{
		return _resU;
	}
	else
	{
		_resU_old = _grad_u_old[_qp] * _grad_test[_i][_qp];
		return 0.5 * (_resU + _resU_old);
	}
}

Real
CNDiffusion::computeQpJacobian()
{
	if (_t_step == 1)
	{
		return  _grad_phi[_j][_qp] * _grad_test[_i][_qp];
	}
	else
	{
		return 0.5 * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
	}
}
