class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.102/mopm-0.0.102-macos-arm64.tar.gz"
      sha256 "3677c8f010d2a210393c9851ba5c336ca1b117ed46ae5230e42eea499c4b82b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.102/mopm-0.0.102-linux-aarch64.tar.gz"
      sha256 "7226411fe30428c2577d16473250e676e8260848709bc7613fb55fe674d23cbe"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.102/mopm-0.0.102-linux-x86_64.tar.gz"
      sha256 "4553a9afd3ba122127def50fab2392997bfd16d5dc6b2c147ca9474c5e681e8c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
