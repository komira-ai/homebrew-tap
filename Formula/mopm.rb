class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.37/mopm-0.0.37-macos-arm64.tar.gz"
      sha256 "07a0cdfa2f379d61256734dd26ea095e40c5ddcfd214791b4439e4c975064ae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.37/mopm-0.0.37-linux-aarch64.tar.gz"
      sha256 "0de97e23a4622b616c7b4f8a9c5e36dd5c1b36714a4fa04a75f1ffd0ef1cd4c1"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.37/mopm-0.0.37-linux-x86_64.tar.gz"
      sha256 "02b1d6ea3c8636d721396f9c22e23552838b816df4bfb9f33705134c103f57ba"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
