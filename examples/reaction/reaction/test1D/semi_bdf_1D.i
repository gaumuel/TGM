[Mesh]
 type = GeneratedMesh
 dim = 1
 xmin = -20
 xmax = 20
 nx = 2000
 []
 
 
[Variables]
[./reactionDiff]
 order = FIRST
 family = LAGRANGE
 [../]
 []
 
[Functions]
[./initial_condition_funct]
 type = ParsedFunction
 value = '0.7*exp(-x^2)'
 [../]
 []
 
[ICs]
[./u_ic]
 type = FunctionIC
 variable = reactionDiff
 function = initial_condition_funct
 [../]
 []
 
[Kernels]
[./constant_diff]
 type = BDFDiffusion
 variable = reactionDiff
 constant = 1.0
 [../]
[./reaction]
 type =  SBDFReaction
 variable = reactionDiff
 a = 1
 alpha = 0.1
 [../]
[./time_dev]
 type = BDFTimeDerivative
 variable = reactionDiff
 [../]
 []
 
[BCs]
 
[./left]
 type = DirichletBC
 variable = reactionDiff
 boundary = left
 value = 0
 [../]
 
[./right]
 type = DirichletBC
 variable = reactionDiff
 boundary = right
 value = 0
 [../]
 []
 
[Executioner]
 type = Transient
 solve_type = Newton
 num_steps = 40
 dt = 1
 []

 
[Outputs]
 exodus = true
 csv = true
 []
