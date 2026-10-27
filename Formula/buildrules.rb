class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.58/buildrules-cli-0.0.58-macos-arm64.tar.gz"
      sha256 "f543ead74889f435e9816b10b125298af3fa712b53480a026ec17096c53a22bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.58/buildrules-cli-0.0.58-linux-aarch64.tar.gz"
      sha256 "62a1420673069f0ffd4acb4cae4973dc64b1cc6dfd392e70114e083332081ce7"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.58/buildrules-cli-0.0.58-linux-x86_64.tar.gz"
      sha256 "4f8f536c93e5b9d99f5a8a8a852a1e68ff3b1277bda8e2242a7f6a88fdca17fe"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
