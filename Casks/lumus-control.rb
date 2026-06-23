cask "lumus-control" do
  version "0.3.0"

  on_arm do
    url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/lumus-control_#{version}_aarch64.dmg",
        verified: "github.com/dotfn/lumus-control/"
    sha256 :no_check
  end
  on_intel do
    url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/lumus-control_#{version}_x86_64.dmg",
        verified: "github.com/dotfn/lumus-control/"
    sha256 :no_check
  end

  name "Lumus Control"
  desc "Desktop control application for Lumus devices"
  homepage "https://github.com/dotfn/lumus-control"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "lumus-control.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/lumus-control.app"]
  end
end
