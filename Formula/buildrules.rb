class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.66/buildrules-cli-0.0.66-macos-arm64.tar.gz"
      sha256 "73262fdf31127ba9ac3b2a41e8423dd00adb2a1083b6652b5c01eb6ce2ad6563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.66/buildrules-cli-0.0.66-linux-aarch64.tar.gz"
      sha256 "04d110ad07bb61421b3d60d9032ba2d3b272ee36ba0795fbd210da3b4ced47f6"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.66/buildrules-cli-0.0.66-linux-x86_64.tar.gz"
      sha256 "ffd460fe7167a2c43b0d69f7ae98eea44b2ed2a8c54dbcece32f194e608d1355"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
