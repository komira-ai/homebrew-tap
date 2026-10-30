class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.68/buildrules-cli-0.0.68-macos-arm64.tar.gz"
      sha256 "4c81c35a4f7c56ac4dcdf722485733225fa0c85aa59493d5d9ed5fba40a84e4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.68/buildrules-cli-0.0.68-linux-aarch64.tar.gz"
      sha256 "7b566b3bdb298f6c9427b47275652bdfb166752bb76e3da7d6adada68b4ced35"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.68/buildrules-cli-0.0.68-linux-x86_64.tar.gz"
      sha256 "fd5d98605e756a711c0f1788acb0d7a1e25894ed9943187637050fd58bf3afc7"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
