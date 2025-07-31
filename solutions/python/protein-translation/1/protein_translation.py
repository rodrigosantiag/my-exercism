CODON_PROTEIN = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP",
}


def proteins(strand):
    codon_length = 3
    result = []
    codons = [strand[i:i+codon_length] for i in range(0, len(strand), codon_length)]

    for codon in codons:
        if CODON_PROTEIN[codon] == "STOP":
            break

        result.append(CODON_PROTEIN[codon])

    return result
