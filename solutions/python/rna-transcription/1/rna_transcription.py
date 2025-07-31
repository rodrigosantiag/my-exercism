RNA_TRANSALATION = {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U",
}


def to_rna(dna_strand):
    result = ""

    for dna in dna_strand:
        result += RNA_TRANSALATION[dna]

    return result
