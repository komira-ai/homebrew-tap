class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.55/buildrules-cli-0.0.55-macos-arm64.tar.gz"
      sha256 "d0fae9c4987a7bfa7540d4fc05019730d291e8de42e84d4319b3ac3bb2bedc0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.55/buildrules-cli-0.0.55-linux-aarch64.tar.gz"
      sha256 "a513ae8801117ec81e1a50d95d945db8f90060c23a91889f18f1b47ef69fd5df"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.55/buildrules-cli-0.0.55-linux-x86_64.tar.gz"
      sha256 "058731a151aa3bb842ff646e9f6b6ea718a76a116878118c70bee00c40238b21"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
