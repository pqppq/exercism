use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut s = HashSet::<u32>::new();
    let mut sum = 0;

    factors.iter().cloned().filter(|&f| f > 0).for_each(|f| {
        let n = limit / f;
        (1..=n).for_each(|i| {
            let v = i * f;
            if v < limit && !s.contains(&v) {
                sum += v;
                s.insert(v);
            }
        });
    });

    sum
}
