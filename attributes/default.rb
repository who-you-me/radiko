default[:system][:timezone] = "Asia/Tokyo"
default[:ntp][:servers] = ["ntp.nict.jp", "ntp.jst.mfeed.ad.jp"]

default[:radiko][:user] = "radiko"
default[:radiko][:home_dir] = "/var/radiko"

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

default[:radiko][:save_to] = "/var/radiko/rec"
