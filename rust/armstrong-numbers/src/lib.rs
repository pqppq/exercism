pub fn is_armstrong_number(num: u32) -> bool {
    let n = num.to_string().len() as u32;
    let s: u32 = num
        .to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .map(|m| m.pow(n))
        .sum();

    s == num
}
