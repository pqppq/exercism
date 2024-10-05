pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = Vec::new();

    let open_brackets = "{([";
    let close_brackets = "})]";

    for c in string.chars() {
        if open_brackets.contains(c) {
            stack.push(c);
        }
        if close_brackets.contains(c) {
            let p = stack.pop();
            if p.is_none() {
                return false;
            }

            let op = p.unwrap();
            let ok = match (op, c) {
                ('{', '}') => true,
                ('(', ')') => true,
                ('[', ']') => true,
                (_, _) => false,
            };
            if !ok {
                return false;
            }
        }
    }

    // no remained open bracket
    stack.is_empty()
}

pub fn another(string: &str) -> bool {
    let mut brackets: Vec<char> = Vec::new();

    for c in string.chars() {
        match c {
            '{' | '(' | '[' => brackets.push(c),
            ')' => {
                if brackets.pop() != Some('(') {
                    return false;
                }
            },
            '}' => {
                if brackets.pop() != Some('{') {
                    return false;
                }
            },
            ']' => {
                if brackets.pop() != Some('[') {
                    return false;
                }
            },
            _ => ()
        }
    }

    brackets.is_empty()
}
