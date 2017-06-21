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
 type = Diffusion
 variable = reactionDiff
  epsilon = 1
 lambda = 1
 nu = 1
 [../]
[./reaction]
 type = ExampleReaction
 variable = reactionDiff
 a = 1
 alpha = 0.1
   epsilon = 1
 lambda = 1
 nu = 1
 [../]
[./time_dev]
 type = TimeDerivative
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
 
 [UserObjects]
 [./fine_solution]
# Read in the fine grid solution
 type = SolutionUserObject
 system_variables = reactionDiff
 mesh = reaction_cn_out_3199_mesh.xda
 es = reaction_cn_out_3199.xda
 [../]
 []
 
 [Functions]
 [./fine_function]
# Create a Function out of the fine grid solution
# Note: This references the SolutionUserObject above
 type = SolutionFunction
 solution = fine_solution
 [../]
 []
 
 [Preconditioning]
 active = 'FDP'
 [./FDP]
 type = SMP
 full = true
 [../]
 []
 
[Executioner]
 scheme = bdf2
 type = Transient
 solve_type = Newton
 num_steps = 1600
 dt = 0.00625
 []
 
 [Postprocessors]
 [./error]
# Compute the error between the computed solution and the fine-grid solution
 type = ElementL2Error
 variable = reactionDiff
 function = fine_function
 [../]
 []
 
[Outputs]
 execute_on = 'timestep_end'
 exodus = true
 csv = true
 []
