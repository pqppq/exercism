use itertools::Itertools;
use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let anagrams: HashSet<String> = word
        .to_lowercase()
        .chars()
        .permutations(word.chars().count())
        .map(String::from_iter)
        .collect();

    let base: Vec<&'a str> = possible_anagrams
        .iter()
        .filter(|&&a| {
            let b = a.to_lowercase();
            word.to_lowercase() != b && anagrams.contains(&b)
        })
        .copied()
        .collect();

    HashSet::from_iter(base)
}
