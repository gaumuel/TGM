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

#ifndef CNDIFFUSION_H
#define CNDIFFUSION_H

#include "Kernel.h"

class CNDiffusion;

template<>
InputParameters validParams<CNDiffusion>();

/**
 * This kernel implements the Laplacian operator:
 * $\nabla u \cdot \nabla \phi_i$
 */
class CNDiffusion : public Kernel
{
public:
  CNDiffusion(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  virtual Real computeQpJacobian() override;
	
	const VariableValue & _u_old;
	const VariableValue & _u_older;
	const VariableGradient & _grad_u_old;
	int & _t_step;
	Real _resU;
	Real _resU_old;
};


#endif /* CNDIFFUSION_H */
