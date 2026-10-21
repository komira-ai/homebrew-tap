class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.13/buildrules-cli-0.0.13-macos-arm64.tar.gz"
      sha256 "84b889367f244ba0480a662bd99d99e6c7b907de69fbf224f6bc5826bb2e24f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.13/buildrules-cli-0.0.13-linux-aarch64.tar.gz"
      sha256 "fcfb4b5e71c5ef29b2207dc4df69ce3a7b176257992860eeb6668f4dca300e2b"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.13/buildrules-cli-0.0.13-linux-x86_64.tar.gz"
      sha256 "3a93465669b44a5f23924d7e14735422dc2312db15c36340bd5a6c127b08742b"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
