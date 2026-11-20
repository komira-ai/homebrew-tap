class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.120/mopm-0.0.120-macos-arm64.tar.gz"
      sha256 "f5695b1b2837769868691bd115f3eea1279857907c1f0f9b6105610f5048cc46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.120/mopm-0.0.120-linux-aarch64.tar.gz"
      sha256 "da5ede727efd0d26b476c11add6c06b6143c483ea59f1cf37b20c6132a47361a"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.120/mopm-0.0.120-linux-x86_64.tar.gz"
      sha256 "ba6fea18ed997956279d8d31417ebd6bc3b3b0aadf5cdabf160002732b9494dc"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
