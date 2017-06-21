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
#include "ExampleApp.h"
#include "Moose.h"
#include "Factory.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

// Example 2 Includes
#include "ExampleConvection.h"           // <- New include for our custom kernel
#include "ExampleDiffusion.h"
#include "ConstantDiffusion.h"
#include "ExampleReaction.h"
#include "ExplicitReaction.h"
#include "ExampleTimeDerivative.h"
#include "NonlinearDiffusion.h"
#include "LinearABReaction.h"
#include "ExplicitNonlinearDiffusion.h"
#include "CNDiffusion.h"
#include "BDFDiffusion.h"
#include "BDFTimeDerivative.h"
#include "BDFTimeDerivative2.h"
#include "BDFTimeDerivative3.h"
#include "NonlinearCNDiffusion.h"
#include "SBDFReaction.h"
#include "SBDFReaction3.h"
#include "Sbdf3Aux.h"
#include "SemiNonlinearCNDiffusion.h"

template<>
InputParameters validParams<ExampleApp>()
{
  InputParameters params = validParams<MooseApp>();
  return params;
}

ExampleApp::ExampleApp(InputParameters parameters) :
    MooseApp(parameters)
{
  srand(processor_id());

  Moose::registerObjects(_factory);
  ExampleApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ExampleApp::associateSyntax(_syntax, _action_factory);
}

ExampleApp::~ExampleApp()
{
}

void
ExampleApp::registerObjects(Factory & factory)
{
  // Register any custom objects you have built on the MOOSE Framework
  registerKernel(ExampleDiffusion);
	registerKernel(ConstantDiffusion);
	registerKernel(ExampleReaction);
	registerKernel(ExampleTimeDerivative);
	registerKernel(NonlinearDiffusion);
	registerKernel(ExplicitReaction);
	registerKernel(ExplicitNonlinearDiffusion);
	registerKernel(LinearABReaction);
	registerKernel(CNDiffusion);
	registerKernel(NonlinearCNDiffusion);
  registerKernel(BDFDiffusion);
  registerKernel(BDFTimeDerivative);
  registerKernel(SBDFReaction);
	registerKernel(BDFTimeDerivative2);
	registerKernel(BDFTimeDerivative3);
	registerKernel(SBDFReaction3);
  registerKernel(ExampleConvection);
	registerKernel(SemiNonlinearCNDiffusion);
	registerAux(Sbdf3Aux);
 // <- registration
}

void
ExampleApp::registerApps()
{
  registerApp(ExampleApp);
}

void
ExampleApp::associateSyntax(Syntax& /*syntax*/, ActionFactory & /*action_factory*/)
{
}
