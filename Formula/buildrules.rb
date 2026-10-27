class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.56/buildrules-cli-0.0.56-macos-arm64.tar.gz"
      sha256 "2a8a4c9e33df9a9250afcab0e2ec99590c08ef07766505c319db1051f1e79460"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.56/buildrules-cli-0.0.56-linux-aarch64.tar.gz"
      sha256 "9cd4d97c861bb23b0fab1eb14a830bee0cf4cac7b2aa1084d845785fd4308bd1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.56/buildrules-cli-0.0.56-linux-x86_64.tar.gz"
      sha256 "21a97247aa5fe0cb9e16b56f040149bc285af4d9f34d468cadea589dd0f27fe4"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
