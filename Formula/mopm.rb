class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.139/mopm-0.0.139-macos-arm64.tar.gz"
      sha256 "e9e6306e85569a196185c47a42f7928bc5c8732e1e3a3d0c78f369532093764f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.139/mopm-0.0.139-linux-aarch64.tar.gz"
      sha256 "8f3cfeef0287f591128afc7031924d875253d14d420ded650c5e55d4a35e9e78"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.139/mopm-0.0.139-linux-x86_64.tar.gz"
      sha256 "e486e45f9b92c60ceb78e211c8bc2ac8e3827f701fcbcc4194d951993169b5f7"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
