 [Mesh]
type = GeneratedMesh
dim = 3
zmin = -20
zmax = 20
ymin = -20
ymax = 20
xmin = -20
xmax = 20
nx = 40
ny = 40
[]


[Variables]
[./reactionDiff]
[../]
[]

[Functions]
[./initial_condition_funct]
type = ParsedFunction
value = '0.61*exp(-0.1 * (x-4)^2 - 0.3 * (y)^2 -0.2 * (z+1)^2) + 0.61*exp(-0.1 * (x+4)^2 - 0.3 * (y)^2 -0.2*(z-1)^2) + 0.61*exp(-0.1 * (x+4)^2 - 0.3 * (y)^2 - 0.2*(z+1)^2)'
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
[../]
[./reaction]
type = ExampleReaction
variable = reactionDiff
a = 1
alpha = 0.1
[../]
[./time_dev]
type = TimeDerivative
variable = reactionDiff
[../]
[]

[BCs]

[./left]
type = DiffusionFluxBC
variable = reactionDiff
boundary = left
value = 0
[../]

[./right]
type = DiffusionFluxBC
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
[]
