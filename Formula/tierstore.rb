class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.142/tierstore-0.3.142-macos-arm64.tar.gz"
      sha256 "3556718263833ae70051b2734e44e1a856b2072bc710e54e162fdb4e207c3653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.142/tierstore-0.3.142-linux-aarch64.tar.gz"
      sha256 "f1e9a069314d265fa755b2f50ed49501380e56ba10c78cc14fdb24ec4d1444dc"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.142/tierstore-0.3.142-linux-x86_64.tar.gz"
      sha256 "4c0de415346f401b2f3c15bed2c8eb44d1ac4fd25247ec7a3c74b45b4e6bd4ea"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
