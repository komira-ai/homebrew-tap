class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.108/mopm-0.0.108-macos-arm64.tar.gz"
      sha256 "0e525e662d9c89f3f25780125313c46fe479998b2f8cab6cc277bf6618c3bbe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.108/mopm-0.0.108-linux-aarch64.tar.gz"
      sha256 "d72b60531e92db004bbf6894496a5fe71fd4bb0e438998cc8ef234e1772591ce"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.108/mopm-0.0.108-linux-x86_64.tar.gz"
      sha256 "e592ceb47dc97083a22c97e4921b1ec5d33bc09389cd6a280d52c81f0d3e7d2b"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
