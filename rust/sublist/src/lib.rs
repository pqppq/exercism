#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(l1: &[T], l2: &[T]) -> Comparison {
    match (l1, l2) {
        ([], []) => Comparison::Equal,
        ([], _) => Comparison::Sublist,
        (_, []) => Comparison::Superlist,
        (_, _) => {
            let a = l1.windows(l2.len()).any(|l| l == l2);
            let b = l2.windows(l1.len()).any(|l| l == l1);
            match (a, b) {
                (true, true) => Comparison::Equal,
                (true, false) => Comparison::Superlist,
                (false, true) => Comparison::Sublist,
                (false, false) => Comparison::Unequal,
            }
        }
    }
}
