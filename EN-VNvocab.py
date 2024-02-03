def generate_anki_cards(word_pairs):
    anki_cards = []
    for idx, word_pair in enumerate(word_pairs, start=1):
        words = word_pair.split(" - ")
        cloze_cards = [f"{{{{c{i}::{word}}}}}" for i, word in enumerate(words, start=1)]
        cloze_question = " - ".join(cloze_cards)
        anki_cards.append(f"{cloze_question}\n")
    return anki_cards

def export_to_anki_file(anki_cards, output_file):
    with open(output_file, 'w', encoding='utf-8') as file:
        for card in anki_cards:
            file.write(card)

if __name__ == "__main__":
    word_pairs_input = [
        "stand up - đứng lên",
"sit down - ngồi xuống",
"look at ... - nhìn vào ...",
"look - nhìn",
"sit - ngồi",
"stand - đứng",
"come - tới, đến",
"come in - vào trong",
"go - đi",
"go out - đi ra ngoài",
"talk - nói",
"don't talk - không nói chuyện, yên lặng",
        # Thêm các cặp từ khác nếu cần
    ]

    anki_cards_output = generate_anki_cards(word_pairs_input)
    export_to_anki_file(anki_cards_output, "anki_cards.txt")