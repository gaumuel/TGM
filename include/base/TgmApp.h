#ifndef TGMAPP_H
#define TGMAPP_H

#include "MooseApp.h"

class TgmApp;

template<>
InputParameters validParams<TgmApp>();

class TgmApp : public MooseApp
{
public:
  TgmApp(InputParameters parameters);
  virtual ~TgmApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* TGMAPP_H */
