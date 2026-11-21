class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.80/buildrules-cli-0.0.80-macos-arm64.tar.gz"
      sha256 "14fb310649907154123c1baa590126f359d9e4833277b2fa8734bc21e5eeacb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.80/buildrules-cli-0.0.80-linux-aarch64.tar.gz"
      sha256 "0e5d7df10ff64b617cb8e968802e1827767d9699325f117c7b8917face649b3c"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.80/buildrules-cli-0.0.80-linux-x86_64.tar.gz"
      sha256 "c9660aba921a3cb9b2f15e0b164ca4ed624372a6e619f13c332c889c8415e1b9"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
