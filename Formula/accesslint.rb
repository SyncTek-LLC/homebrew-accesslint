class Accesslint < Formula
  desc "Static accessibility analysis for iOS/Swift apps"
  homepage "https://github.com/SyncTek-LLC/AccessLint"
  version "1.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/SyncTek-LLC/AccessLint/releases/download/v#{version}/accesslint-#{version}.artifactbundle.zip"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    bundle_dir = "accesslint-#{version}-macos"
    if File.exist?("#{bundle_dir}/bin/accesslint")
      bin.install "#{bundle_dir}/bin/accesslint"
    elsif File.exist?("accesslint")
      bin.install "accesslint"
    else
      # Fallback: find the binary wherever it is in the extracted archive
      binary = Dir.glob("**/accesslint").find { |f| File.executable?(f) && !File.directory?(f) }
      bin.install binary if binary
    end
  end

  test do
    assert_match "AccessLint", shell_output("#{bin}/accesslint --version")
  end
end
