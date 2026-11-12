cask "mouse-keys-record-replay" do
  version "0.1.6"
  sha256 "5d533ae0de76616eff2a67a6791258ad0001220ebf16bc9ba76cd10dbb2f93ae"

  url "https://github.com/tiktool/mouse-keys-record-replay/releases/download/v#{version}/mouse-keys-record-replay-macos.zip",
      verified: "github.com/tiktool/mouse-keys-record-replay/"
  name "Mouse Keys Record Replay"
  desc "Record mouse and keyboard input and replay it once or on a loop"
  homepage "https://mouserec.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Mouse Keys Record Replay.app"

  zap trash: [
    "~/Library/Application Support/Mouse Keys Record Replay",
    "~/Library/LaunchAgents/tools.tik.mousekeysrecordreplay.plist",
  ]

  caveats <<~EOS
    Mouse Keys Record Replay needs two permissions before it can record or replay:
      System Settings > Privacy & Security > Accessibility
      System Settings > Privacy & Security > Input Monitoring
    Turn the app on in both lists, then quit and reopen it.

    The app is ad-hoc signed and not notarized. If macOS blocks the first launch,
    open System Settings > Privacy & Security and choose Open Anyway.
  EOS
end
