pub fn factors(n: u64) -> Vec<u64> {
    let mut ps: Vec<u64> = [].to_vec();

    let mut n = n;
    let mut m = 2;

    while n != 1 {
        if n % m == 0 {
            ps.push(m);
            n /= m;
        } else {
            m += 1;
        }
    }

    ps
}
