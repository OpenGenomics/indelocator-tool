cwlVersion: v1.0
class: CommandLineTool
label: Indelocator
baseCommand: ["java", "-Xmx7g", "-jar", "/opt/IndelGenotyper.jar", "-T", "IndelGenotyperV2"]
requirements:
  - class: DockerRequirement
    dockerImageId: kamichiotti/indelocator
#    dockerPull: opengenomics/indelocator-tool:latest

inputs:
  somatic_flag:
    type: boolean
    default: true
    inputBinding:
      prefix: --somatic
  quiet_flag:
    type: boolean
    default: true
    inputBinding:
      prefix: -quiet
  normal:
    type: File
    inputBinding:
      prefix: --input_file:normal
    secondaryFiles:
      - .bai
  tumor:
    type: File
    inputBinding:
      prefix: --input_file:tumor
    secondaryFiles:
      - .bai
  reference:
    type: File
    inputBinding:
      prefix: -R
    secondaryFiles:
      - .fai
      - ^.dict
  bed_file:
    type: File
    inputBinding:
      prefix: -L
  report:
    type: string
    default: DEV
    inputBinding:
      prefix: -et
  vcf:
    type: string
    default: indelocator.vcf
    inputBinding:
      prefix: -o

outputs:
  output_vcf:
    type: File
    outputBinding:
      glob: $(inputs.vcf)
