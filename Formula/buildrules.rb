class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.82/buildrules-cli-0.0.82-macos-arm64.tar.gz"
      sha256 "a8f1a64cb6c18fa1615825097fdf201d08e9f9c04213cfa6f99e0ebac95b7b02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.82/buildrules-cli-0.0.82-linux-aarch64.tar.gz"
      sha256 "1fceaadb6d441e629d52272a44255d648ce7bccd1b2d740d5c631504847d0e9b"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.82/buildrules-cli-0.0.82-linux-x86_64.tar.gz"
      sha256 "907c9823c8508e9dfdb3333282db178a74ce4d4e10973ca5122f607323a6d64d"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
