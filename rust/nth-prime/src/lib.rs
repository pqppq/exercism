pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = [2].to_vec();
    let mut p = 3;

    while primes.len() < ((n + 1) as usize) {
        let is_prime = primes.iter().map(|i| p % i != 0).all(|b| b);
        match is_prime {
            true => primes.push(p),
            false => p += 2,
        }
    }

    *primes.last().unwrap()
}
