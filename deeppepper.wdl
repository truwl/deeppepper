version 1.0

workflow deeppepper{
    input {
        File bam
        File ref
        Int threads = 64 # https://cloud.google.com/life-sciences/docs/tutorials/deepvariant
        String longreadtype = "ont" #ont_r9_guppy5_sup or ont_r10_q20 or hifi or ont
    }

    call deeppeppertask {
        input:
            bam = bam,
            ref = ref,
            threads = threads,
            longreadtype = longreadtype
    }

    output {
        File vcf_output = deeppeppertask.vcf_output
    }

    meta {allowNestedInputs: true}
}


# https://github.com/kishwarshafin/pepper
task deeppeppertask {
    input {
        File bam
        File ref
        Int threads
        String longreadtype
    }

    command {
        run_pepper_margin_deepvariant call_variant \
        -b ~{bam} \
        -f ~{ref} \
        -o output \
        -t ~{threads} \
        --~{longreadtype}
    }

    runtime {
        cpu: threads
        docker: "kishwars/pepper_deepvariant:r0.6"
        disks: "local-disk 300 HDD"
        memory: 240 + " GB" # https://cloud.google.com/life-sciences/docs/tutorials/deepvariant
    }

    output {
        File vcf_output = glob("output/*.vcf*")[0]  # workaround for check_gds issues with drs URIs
    }
}