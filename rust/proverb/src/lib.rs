pub fn build_proverb(list: &[&str]) -> String {
    if list.is_empty() {
        "".to_string()
    } else if list.len() == 1 {
        format!("And all for the want of a {}.", list[0])
    } else {
        list.windows(2)
            .map(|pair| format!("For want of a {} the {} was lost.", pair[0], pair[1]))
            .collect::<Vec<String>>()
            .join("\n")
            + format!("\nAnd all for the want of a {}.", list[0]).as_str()
    }
}
