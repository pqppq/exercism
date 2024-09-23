use core::fmt;

#[derive(Debug, Eq, PartialEq)]
pub struct Clock {
    hour: i32,
    minute: i32,
}

const SECONDS_IN_MINUTE: i32 = 60;
const HOURS: i32 = 24;

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let div = minutes.div_euclid(SECONDS_IN_MINUTE);
        let minute = minutes.rem_euclid(SECONDS_IN_MINUTE);
        let hour = (hours + div).rem_euclid(HOURS);

        Self { hour, minute }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let (div, minute) = (
            (self.minute + minutes).div_euclid(SECONDS_IN_MINUTE),
            (self.minute + minutes).rem_euclid(SECONDS_IN_MINUTE),
        );
        let hour = (self.hour + div).rem_euclid(HOURS);

        Self { hour, minute }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:02}:{:02}", self.hour, self.minute)
    }
}
