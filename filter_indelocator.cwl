cwlVersion: v1.0
class: CommandLineTool

label: Filter Indelocator VCF on T_DP field

requirements:
  - class: DockerRequirement
    dockerPull: opengenomics/indelocator-tool:latest

baseCommand: [python, /opt/filter_indelocator.py]

inputs:

  output_name:
    type: string
    default: output.vcf
    inputBinding:
      position: 3

  tdp:
    type: int?
    inputBinding:
      prefix: --tdp

  vcf:
    type: File
    inputBinding:
      position: 2

outputs:
  output_vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
