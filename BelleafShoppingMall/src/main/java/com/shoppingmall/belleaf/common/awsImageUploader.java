package com.shoppingmall.belleaf.common;

import java.io.IOException;

import javax.annotation.PostConstruct;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class awsImageUploader {
    private AmazonS3 amazonS3;

    @Value("${aws.s3.bucket}")
    private String bucket;

    @Value("${aws.s3.accessKey}")
    private String accessKey;

    @Value("${aws.s3.secretKey}")
    private String secretKey;

    @Value("${aws.s3.region}")
    private String region;

    /**
     * AmazonS3 초기화
     * @PostConstruct에 의해 어플리케이션 시작 시 한번만 실행
     */
    @PostConstruct
    private void s3Client() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);

        amazonS3 = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.AP_NORTHEAST_2.getName())
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
    }

    //S3에 파일 업로드
    public String uploadImage(MultipartFile multipartFile) {
        String newFileName = multipartFile.getOriginalFilename();

        try {
            String fileType = checkFileType(multipartFile);

            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentType(fileType);
            System.out.println(region.toString() + secretKey.toString() + "  " + accessKey.toString() + "  " + bucket.toString());
            amazonS3.putObject(new PutObjectRequest(bucket, newFileName, multipartFile.getInputStream(), objectMetadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead));
        } catch (IOException exception) {
            
        }

        return amazonS3.getUrl(bucket, newFileName).toString();
    }

    /**
     * S3에서 파일 삭제
     * @param fileName
     */
    public void deleteFile(String fileName) {
    	System.out.println(fileName);
        amazonS3.deleteObject(new DeleteObjectRequest(bucket, fileName));
    }

    /**
     * 파일 타입 확인
     * Files.probeContentType()은 확장자를 이용하여 타입을 확인하기 때문에 확장자가 없으면 null을 리턴
     * 대신 Apache Tika는 메타데이터를 이용하여 타입을 확인하기 때문에 확장자가 없어도 정확한 타입을 확인할 수 있음
     * 파일 타입이 사진이 아닐 경우 IllegaArgumentException 발생 후 중단
     *
     * @param multipartFile
     * @return fileType
     */
    public String checkFileType(MultipartFile multipartFile) throws IOException {
        String fileType = new Tika().detect(multipartFile.getInputStream());
        
        if (!(MediaType.IMAGE_JPEG_VALUE.equals(fileType) || MediaType.IMAGE_PNG_VALUE.equals(fileType) || MediaType.IMAGE_GIF_VALUE.equals(fileType))) {
            throw new IllegalArgumentException("사진 파일이 아닙니다.");
        }
        
        
        return fileType;
    }

	
}
