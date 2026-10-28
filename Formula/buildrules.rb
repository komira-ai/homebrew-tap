class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.62/buildrules-cli-0.0.62-macos-arm64.tar.gz"
      sha256 "052ad890ed64ea6a931364c2fef334db589891f6be22d1be02f1998b66ee3e79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.62/buildrules-cli-0.0.62-linux-aarch64.tar.gz"
      sha256 "91b486e528017e3022e839a40ef4cb4a6dbfe41401aaecd201e1f27cced1b81b"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.62/buildrules-cli-0.0.62-linux-x86_64.tar.gz"
      sha256 "e65d513859d33b6589959fedfb8a450dbc24782869eb03ada61fd0638638f733"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
