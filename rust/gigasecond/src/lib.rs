use time::Duration;

use time::PrimitiveDateTime as DateTime;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    start + Duration::seconds((10_i64).pow(9_u32))
    // or 1_000_000_000
}
