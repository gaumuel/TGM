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

#include "SemiNonlinearCNDiffusion.h"


template<>
InputParameters validParams<SemiNonlinearCNDiffusion>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak form of $(\\nabla \\phi_i, \\nabla u_h)$.");
  return params;
}

SemiNonlinearCNDiffusion::SemiNonlinearCNDiffusion(const InputParameters & parameters) :
    Kernel(parameters),
		_u_old(valueOld()),
		_u_older(valueOlder()),
		_t_step(_fe_problem.timeStep()),
		_grad_u_old(_var.gradSlnOld())
{
}

Real
SemiNonlinearCNDiffusion::computeQpResidual()
{	
	if ( _t_step == 1)
	{
		return _u_old[_qp] * _grad_u[_qp] * _grad_test[_i][_qp];
	}
	else
	{
		return 0.5 * _u_old[_qp] * _grad_test[_i][_qp] * (_grad_u[_qp] + _grad_u_old[_qp]);
	}
}

Real
SemiNonlinearCNDiffusion::computeQpJacobian()
{
	if (_t_step == 1)
	{
		return _u_old[_qp] * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
	}
	else
	{
		return 0.5 * _u_old[_qp] * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
	}
}
