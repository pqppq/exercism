pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        None
    } else {
        Some(collatz_steps(0, n))
    }
}

fn collatz_steps(steps: u64, value: u64) -> u64 {
    if value == 1 {
        return steps;
    }
    let next_value = if value % 2 == 0 {value / 2} else {3 * value + 1};
    collatz_steps(steps + 1, next_value)
}
