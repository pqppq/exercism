pub fn reply(message: &str) -> &str {
    match message {
        message if is_empty(message) => "Fine. Be that way!",
        message if is_yelling(message) && is_question(message) => {
            "Calm down, I know what I'm doing!"
        }
        message if is_yelling(message) => "Whoa, chill out!",
        message if is_question(message) => "Sure.",
        _ => "Whatever.",
    }
}

fn is_empty(s: &str) -> bool {
    s.trim().is_empty()
}

fn is_question(s: &str) -> bool {
    s.trim().ends_with('?')
}

fn is_yelling(s: &str) -> bool {
    let mut cs = s.chars();
    cs.any(|s| s.is_alphabetic()) && cs.filter(|s| s.is_alphabetic()).all(|s| s.is_uppercase())
}
