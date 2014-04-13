default[:radiko][:programs] = [
    {
        :name       => "IJUIN",
        :channel    => "TBS",
        :minute    => "55",
        :hour       => "0",
        :day        => "*",
        :month      => "*",
        :weekday    => "TUE",
        :time       => "125"
    },
    {
        :name       => "AUDREY",
        :channel    => "LFR",
        :minute    => "55",
        :hour       => "0",
        :day        => "*",
        :month      => "*",
        :weekday    => "SUN",
        :time       => "125"
    }
]

default[:radiko][:save_to] = "/home/radiko/rec"
