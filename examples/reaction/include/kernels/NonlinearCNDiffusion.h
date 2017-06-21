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

#ifndef NONLINEARCNDIFFUSION_H
#define NONLINEARCNDIFFUSION_H

#include "Kernel.h"

class NonlinearCNDiffusion;

template<>
InputParameters validParams<NonlinearCNDiffusion>();

/**
 * This kernel implements the Laplacian operator:
 * $\nabla u \cdot \nabla \phi_i$
 */
class NonlinearCNDiffusion : public Kernel
{
public:
  NonlinearCNDiffusion(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  virtual Real computeQpJacobian() override;
	
	const VariableValue & _u_old;
	const VariableValue & _u_older;
	int & _t_step;
	const VariableGradient & _grad_u_old;
	Real _resU;
	Real _resU_old;
};


#endif /* NONLINEARCNDIFFUSION_H */
