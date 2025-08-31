--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: server_hit_bin; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE server_hit_bin (
    server_hit_bin_id character varying(20) NOT NULL,
    content_id character varying(255),
    hit_type_id character varying(20),
    server_ip_address character varying(20),
    server_host_name character varying(255),
    bin_start_date_time timestamp with time zone,
    bin_end_date_time timestamp with time zone,
    number_hits numeric(20,0),
    total_time_millis numeric(20,0),
    min_time_millis numeric(20,0),
    max_time_millis numeric(20,0),
    internal_content_id character varying(20)
);


-- ALTER TABLE public.server_hit_bin OWNER TO ofbiz;

--
-- Name: server_hit_bin pk_server_hit_bin; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY server_hit_bin
    ADD CONSTRAINT pk_server_hit_bin PRIMARY KEY (server_hit_bin_id);


--
-- Name: server_hbin_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX server_hbin_type ON server_hit_bin USING btree (hit_type_id);


--
-- Name: server_hit_bin server_hbin_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY server_hit_bin
    ADD CONSTRAINT server_hbin_type FOREIGN KEY (hit_type_id) REFERENCES server_hit_type(hit_type_id);


--
-- PostgreSQL database dump complete
--

