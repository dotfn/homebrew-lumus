cask "lumus-control" do
  version "0.2.0"
  sha256 :no_check

  url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/lumus-control_#{version}_aarch64.dmg",
      verified: "github.com/dotfn/lumus-control/"
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
