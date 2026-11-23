class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.81/buildrules-cli-0.0.81-macos-arm64.tar.gz"
      sha256 "3778269982a30313699cead68f23477ebb712cd0010dbd45bfd3c984ff264e12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.81/buildrules-cli-0.0.81-linux-aarch64.tar.gz"
      sha256 "34057fc2198293230aee73b76a1fc2252b86f3e4c0086b83a3f7411982338dee"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.81/buildrules-cli-0.0.81-linux-x86_64.tar.gz"
      sha256 "0ec4db385247f2ec15150e42dc10b538091627f865988b3be22ed3580e21ec5b"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
