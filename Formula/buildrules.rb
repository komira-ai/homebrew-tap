class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.33/buildrules-cli-0.0.33-macos-arm64.tar.gz"
      sha256 "51e60f7b5ac5fb4a9c6cab6856735fe7075762ab5bbd33597bd70fbd35835037"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.33/buildrules-cli-0.0.33-linux-aarch64.tar.gz"
      sha256 "a2a5eb5da10adc9e2bb956f6117ac0e094fdad53017fb8dfa93a3cf7c9e025e1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.33/buildrules-cli-0.0.33-linux-x86_64.tar.gz"
      sha256 "a44a4d47f9983ea591ac9ffe60ad1015b4f3ae83d0b716b6de7345189ce011dd"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
